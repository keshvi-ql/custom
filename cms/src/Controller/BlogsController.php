<?php
declare(strict_types=1);

namespace App\Controller;
use Cake\Datasource\ConnectionManager;
use Cake\ORM\Locator\LocatorAwareTrait;
use Cake\ORM\Query;
use Cake\Database\Expression\QueryExpression;
use Cake\ORM\TableRegistry;
use Cake\Error\Debugger;
use DateTime;
use Cake\ORM\Query\SelectQuery;
use Cake\Datasource\Exception\RecordNotFoundException;
use Cake\Http\Exception\NotFoundException;
use Cake\Collection\Collection;
use Cake\Datasource\FactoryLocator;
use Cake\Database\Expression\IdentifierExpression;
use Cake\Database\Expression\TupleComparison;
use Cake\I18n\I18n;

use PHP_CodeSniffer\Filters\ExactMatch;

// use Cake\Collection\CollectionInterface;
// use Cake\I18n\FrozenTime;


/**
 * Blogs Controller
 *
 * @property \App\Model\Table\BlogsTable $Blogs
 */
class BlogsController extends AppController
{
    use LocatorAwareTrait;
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    // public function index()
    // {
    //     $query = $this->Blogs->find();
    //     $blogs = $this->paginate($query);

    //     $this->set(compact('blogs'));
    // }

    // ---------------------------
    // public function index()
    // {
    //     $blogsTable = $this->fetchTable('Blogs');
    //     $query = $blogsTable->find()
    //         ->order(['Blogs.created' => 'DESC']); 
    //     $blogs = $this->paginate($query);
    //     $this->set(compact('blogs'));
    // }

    // ----------------Running Select Statements ------------------
    // public function index()
    // {
    //     // Get the predefined connection
    //     $connection = ConnectionManager::get('dynamic');

    //     // Raw query using the dynamic connection
    //     $results = $connection
    //         ->execute('SELECT * FROM blogs WHERE id = :id', ['id' => 1])
    //         ->fetchAll('assoc');
    //     // dd($results); // Optional: only for debugging

    //     // Still use the default ORM for paginated data
    //     $blogsTable = $this->fetchTable('Blogs');
    //     $blogs = $this->paginate($blogsTable->find());
    //     $this->set(compact('blogs'));
    // }

    // ------------------Running Insert Statements----------------
    public function addRaw()
    {
        $connection = ConnectionManager::get('dynamic');
        $data = [
            'title' => 'A Raw Inserted Blog',
            'content' => 'Lorem',
            'author' => 'Lorem',
            'created' => new \DateTime('now'),
            'modified' => new \DateTime('now'),
        ];
        // Insert using raw connection
        $success = $connection->insert('blogs', $data, [
            'created' => 'datetime',
            'modified' => 'datetime'
        ]);
        dd($success);
    }

    // ------------------Running Update Statements-------------------------
    public function updateRaw()
    {
        $connection = ConnectionManager::get('dynamic');

        // Update title of the blog with id = 1
        $success = $connection->update('blogs', ['title' => 'Updated Title'], ['id' => 5]);

        // Dump and die to check result
        dd($success);
    }

    // ----------------------Running Delete Statements--------------------
    public function deleteRaw()
    {
        $connection = ConnectionManager::get('dynamic');

        // Delete the blog where id = 1
        $success = $connection->delete('blogs', ['id' => 4]);

        // Dump and die to view the result
        dd($success);
    }

    //-------------------------- Query Builder--------------------------
    // public function index()
    // {
    //     // Using LocatorAwareTrait to fetch the table instance manually
    //     $blogsTable = $this->fetchTable('Blogs'); // equivalent to $this->Blogs

    //     // Start a new SelectQuery object
    //     $query = $blogsTable->find();

    //     // Customize the query if needed
    //     $query->select(['id', 'title', 'content', 'author', 'created', 'modified', 'mutation']);

    //     // Execute the query and fetch results
    //     $blogs = $query->all()->toArray();

    //     // Dump and die for debugging
    //     dd($blogs);
    // }

    // ---------------Selecting Rows From A Table--------------
    public function index()
    {
        // Use LocatorAwareTrait to get the Blogs table manually
        $blogsTable = $this->fetchTable('Blogs');

        // Basic query
        $query = $blogsTable->find();

        // Example 1: Simple foreach loop using all()
        foreach ($query->all() as $blog) {
            debug($blog->content); // Outputs each blog title
        }

        // Example 2: Using chained query with where, select, orderBy
        // $query2 = $blogsTable
        //     ->find()
        //     ->select(['id', 'title', 'created'])
        //     ->where(['id !=' => 1])
        //     ->orderBy(['created' => 'DESC']);

        // foreach ($query2->all() as $blog) {
        //     debug($blog->created);
        // }

        // Example 3: View SQL generated by query
        // debug($blogsTable->find()->where(['id' => 1]));

        // Example 4: Execute query and convert to list
        // $resultsIteratorObject = $blogsTable
        //     ->find()
        //     ->where(['id >' => 1])
        //     ->all();

        // foreach ($resultsIteratorObject as $blog) {
        //     debug($blog->id);
        // }

        $resultsArray = $blogsTable
            ->find()
            ->where(['id >' => 1])
            ->all()
            ->toList();

        // foreach ($resultsArray as $blog) {
        //     debug($blog->id);
        // }

        // Debug first result's title if exists
        // if (!empty($resultsArray)) {
        //     debug($resultsArray[0]->title);
        // }

        // Use dd() to stop and dump
        dd($resultsArray);
    }
    // -----------Selecting A Single Row From A Table---------------
    public function singleBlog()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Fetch one blog with id = 1
        $blog = $blogsTable
            ->find()
            ->where(['id' => 2])
            ->first();

        if ($blog) {
            debug($blog->title);
        } else {
            debug('No blog found with ID = 2');
        }

        dd($blog);
    }

    // --------------Getting a List of Values From a Column----------
    public function getTitleList()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Returns [id => title]
        $list = $blogsTable->find('list')->all();

        dd($list); // Will dump and exit
    }

    // -------------ResultSet Is A Collection Object-----------
    public function resultSetCollection()
    {
        $blogs = $this->fetchTable('Blogs');

        // Basic example using combine()
        $keyValueList = $blogs->find()->all()->combine('id', 'title');

        // Advanced example using map() and combine()
        $results = $blogs->find()
            ->where(['id >' => 1])
            ->orderBy(['title' => 'DESC'])
            ->all()
            ->map(function ($row) {
                $row->trimmedTitle = trim($row->title);
                return $row;
            })
            ->combine('id', 'trimmedTitle') // id => trimmed title
            ->toArray(); // Convert to array

        dd($results); // Dump and die (CakePHP debug)
    }

    // -------------------- Selecting Data Examples ---------------------
    public function selectExample()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Example 1: Selecting specific columns
        // $query1 = $blogsTable->find()
        //     ->select(['id', 'title', 'author']);

        // debug('Example 1: Selecting id, title, author');
        // foreach ($query1->all() as $blog) {
        //     debug($blog->title);
        // }

        // Example 2: Aliasing selected columns
        $query2 = $blogsTable->find()
            ->select([
                'blog_id' => 'id',
                'blog_title' => 'title',
                'written_by' => 'author'
            ]);

        debug('Example 2: Aliased fields');
        foreach ($query2->all() as $blog) {
            debug("{$blog->blog_id}: {$blog->blog_title} by {$blog->written_by}");
        }

        // Example 3: Selecting distinct values (e.g., unique authors)
        // $query3 = $blogsTable->find()
        //     ->select(['author'])
        //     ->distinct(['author']);

        // debug('Example 3: Distinct authors');
        // foreach ($query3->all() as $row) {
        //     debug($row->author);
        // }

        // Example 4: Basic WHERE conditions (combined with AND)
        // $query4 = $blogsTable->find()
        //     ->where(['author' => 'Lorem', 'title LIKE' => '%Raw%']);

        // debug('Example 4: WHERE with AND conditions');
        // foreach ($query4->all() as $blog) {
        //     debug("{$blog->id}: {$blog->title}");
        // }

        // Example 5: Multiple where() calls (equivalent to AND)
        // $query5 = $blogsTable->find()
        //     ->where(['author' => 'Lorem'])
        //     ->where(['title LIKE' => '%Updated%']);

        // debug('Example 5: Multiple where() calls');
        // foreach ($query5->all() as $blog) {
        //     debug("{$blog->id}: {$blog->title}");
        // }

        // Example 6: Using a callback with where() for advanced expressions
        $query6 = $blogsTable->find()
            ->where(function (\Cake\Database\Expression\QueryExpression $exp, \Cake\ORM\Query\SelectQuery $q) {
                return $exp
                    ->eq('author', 'Lorem')
                    ->gte('id', 1);
            });

        debug('Example 6: Callback expression in where()');
        foreach ($query6->all() as $blog) {
            debug("{$blog->id}: {$blog->title}");
        }

        // Optional: Convert last query to array and dump
        dd($query6->all()->toArray());
    }

    //-------------- Selecting Specific Fields----------------
    public function selectExamples()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // 1. Select specific fields: id and title
        // $query1 = $blogsTable->find()
        //     ->select(['id', 'title']);
        // debug('Select only id and title');
        // foreach ($query1->all() as $blog) {
        //     debug($blog->id . ' - ' . $blog->title);
        // }

        // 2. Select all fields + a computed "slug" field (title-id)
        // $query2 = $blogsTable->find();
        // $query2
        //     ->select([
        //         'slug' => $query2->func()->concat([
        //             'title' => 'identifier',
        //             "'-'" => 'literal',
        //             'id' => 'identifier'
        //         ])
        //     ])
        //     ->select($blogsTable); // Select all fields from blogs
        // debug('Select all fields + slug');
        // foreach ($query2->all() as $blog) {
        //     debug($blog->slug);
        // }

        // 3. Use selectAlso to add additional field like count
        $query3 = $blogsTable->find();
        $query3->selectAllExcept($blogsTable, []); // Select all fields
        $query3->selectAlso(['row_count' => $query3->func()->count('*')]);
        debug('Select all fields + row_count');
        foreach ($query3->all() as $blog) {
            dd($blog->row_count);
        }

        // 4. Select all fields except the "author" field
        $query4 = $blogsTable->find();
        $query4->selectAllExcept($blogsTable, ['author']);
        debug('Select all except author');
        foreach ($query4->all() as $blog) {
            debug($blog); // author field will be excluded
        }

        // End with die-dump to prevent rendering view
        dd('Select examples completed.');
    }

    // -------------Window-Only Functions--------
    public function window()
    {
        $blogsTable = TableRegistry::getTableLocator()->get('Blogs');

        $query = $blogsTable->find()
            ->leftJoinWith('Categories');

        // ROW_NUMBER() window function expression
        $rowNumberExpression = $query->newExpr()->add('ROW_NUMBER() OVER (ORDER BY Blogs.created DESC)');

        $query->select([
            'row_num' => $rowNumberExpression,
            'Blogs.id',
            'Blogs.title',
            'Blogs.content',
            'Blogs.author',
            'Categories.name',
            'Categories.description',
        ]);

        // Convert result to array to see output
        $results = $query->toArray();

        debug($results);
        die();

        $this->set(compact('results'));
    }

    // ------------Custom Functions -----------
    public function getCustomDateFunctions($query, string $dateField = 'created')
    {
        // YEAR(created)
        $year = $query->func()->year([
            $dateField => 'identifier'
        ]);

        // DATE_FORMAT(created, '%H:%i')
        $time = $query->func()->date_format([
            $dateField => 'identifier',
            "'%H:%i'" => 'literal'
        ]);

        return [
            'yearCreated' => $year,
            'timeCreated' => $time,
        ];
    }
    public function someAction()
    {
        $blogsTable = $this->getTableLocator()->get('Blogs');

        $query = $blogsTable->find();

        $customDates = $this->getCustomDateFunctions($query, 'Blogs.created');

        $query->select([
            'Blogs.id',
            'Blogs.title',
            'Blogs.created',
            'Blogs.category_id',
        ] + $customDates);

        $results = $query->first();

        dd($results); // dump and die the results
    }

    // ---------------------Ordering Results-------
    public function demonstrateOrdering()
    {
        $blogsTable = $this->getTableLocator()->get('Blogs');

        // 1) Order by multiple columns (appends ORDER BY clauses)
        $query = $blogsTable->find();
        $query->orderBy(['title' => 'ASC', 'id' => 'ASC']);
        $results1 = $query->all();

        // 2) Overwrite ORDER BY with a new clause
        $query2 = $blogsTable->find();
        $query2->orderBy(['created' => 'DESC'], Query::OVERWRITE);
        $results2 = $query2->all();

        // 3) Use orderByAsc() for complex expression (concat title and author)
        $query3 = $blogsTable->find();
        $concat = $query3->func()->concat([
            'title' => 'identifier',
            ' - ',
            'author' => 'identifier'
        ]);
        $query3->orderByAsc($concat);
        $results3 = $query3->all();

        // 4) Use Closure for complex ordering logic (CASE expression example)
        $query4 = $blogsTable->find();
        $query4->orderByAsc(function (QueryExpression $exp, Query $query) {
            $caseExpr = $query->newExpr()->case()
                ->when(['author' => 'John'])
                ->then(1)
                ->when(['author' => 'Jane'])
                ->then(2)
                ->else(3);
            return $exp->add($caseExpr);
        });
        $results4 = $query4->all();

        dd([
            'Order by title & id ASC' => $results1,
            'Overwrite order by created DESC' => $results2,
            'Order by concat(title, author) ASC' => $results3,
            'Order by CASE expression ASC' => $results4,
        ]);
    }

    // ------------Aggregates - Group and Having-----------------------
    public function blogStats(): void
    {
        $blogs = $this->fetchTable('Blogs');

        $query = $blogs->find();
        
        $query->select([
            'author',
            'total_blogs' => $query->func()->count('id'),
            'latest_post' => $query->func()->max('created')
        ])
        ->group('author');
        // ->having(function ($exp, $q) {
        //     return $exp->gt('total_blogs', 1);
        // });

        $results = $query->all();

        foreach ($results as $row) {
            debug($row->toArray());
        }

        dd($results);
    }

    // ----------Case Statements------------------
    public function case(): void
    {
        $blogs = $this->fetchTable('Blogs');
        $query = $blogs->find();

        $mutationPublished = $query->newExpr()
            ->case()
            ->when(['mutation' => 'published']) // or whatever value you use
            ->then(1)
            ->else(null);

        $mutationUnpublished = $query->newExpr()
            ->case()
            ->when(['mutation' => 'unpublished'])
            ->then(1)
            ->else(null);

        $query->select([
            'number_published' => $query->func()->count($mutationPublished),
            'number_unpublished' => $query->func()->count($mutationUnpublished)
        ]);

        $result = $query->first();

        if ($result) {
            debug("Published: {$result->number_published}, Unpublished: {$result->number_unpublished}");
        }

        dd($result);
    }
    public function caseSizingExampleBlogs()
    {
        $blogs = $this->fetchTable('Blogs');
        $query = $blogs->find();

        // Build LENGTH(content) expression
        $lengthExpr = $query->func()->length(['content' => 'literal']);

        // Build CASE expression for size classification
        $sizing = $query->newExpr()->case()
            ->when(
                $query->newExpr()->lt($lengthExpr, 300)
            )->then('SHORT')
            ->when(
                $query->newExpr()->between($lengthExpr, 300, 500)
            )->then('MEDIUM')
            ->when(
                $query->newExpr()->gte($lengthExpr, 501)
            )->then('LONG');

        // Select desired fields including the CASE result
        $query = $query->select([
            'id',
            'title',
            'author',
            'created',
            'modified',
            'category_id',
            'size' => $sizing
        ])->limit(10);

        $results = $query->all();

        // Output the results
        foreach ($results as $blog) {
            echo "Blog ID: {$blog->id} | Title: {$blog->title} | Size: {$blog->size}\n";
        }
    }

    // ----------Fetching Arrays Instead of Entities--------
    public function fetchBlogsAsArray()
    {
        $blogs = $this->fetchTable('Blogs');
        $query = $blogs->find();
        $query->enableHydration(false); // Disable entity hydration to get arrays

        $results = $query->toArray(); // Execute and get the result as an array

        dd($results); // Dump and die the result for debugging
    }

    // --------------Adding Calculated Fields----------------
    public function formattedBlogs()
    {
        $blogs = $this->fetchTable('Blogs');

        $query = $blogs->find()
            ->select(['id', 'title', 'created'])
            ->formatResults(function (\Cake\Collection\CollectionInterface $results) {
                return $results->map(function ($row) {
                    // Calculate days since blog was created
                    $row['days_old'] = $row->created->diff(new \DateTime())->days;
                    return $row;
                });
            });

        $results = $query->all();

        // Use dd to dump the results and stop execution
        dd($results);
    }

    // ------------------Advanced Conditions--------------------
    // 1. Simple OR condition
    public function simpleOrCondition()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where([
                'author' => 'Lorem',
                'OR' => [['title' => 'Updated Title']]
            ]);
        dd($query->all());
    }

    // 2. Callback-based complex condition
    public function callbackWhere()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp, SelectQuery $query) {
                // OR condition for author
                $authorExpr = $query->newExpr()
                    ->or(['author' => 'Elvis Bolton'])
                    ->add(['author' => 'Glenna Horton']);

                // AND condition for structured mutation + category
                $publishedExpr = $query->newExpr()
                    ->and(['mutation IS' => null, 'category_id' => 1]);

                return $exp->or([
                    ['mutation IS NOT' => null], // any JSON-mutation defined
                    $query->newExpr()->and([$authorExpr, $publishedExpr])
                ]);
            });
        dd($query->all());
    }

    // 3. Basic combinators: eq, notEq, gt
    public function basicCombinators()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                return $exp
                    ->eq('author', 'Elvis Bolton')
                    ->notEq('category_id', 3)
                    ->gt('id', 5);
            });
        dd($query->all());
    }

    // 4. Mixed AND/OR conditions
    public function andOrMix()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                $orAuthors = $exp->or([
                    'author' => 'Rajah Graves',
                    'author' => 'Orlando Leach'
                ]);

                return $exp
                    ->add($orAuthors)
                    ->gte('id', 2)
                    ->isNull('mutation'); // since most sample entries had mutation = NULL
            });
        dd($query->all());
    }

    // 5. NOT expression
    public function notExpression()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                $orConditions = $exp->or([
                    'author' => 'Rajah Graves',
                    'author' => 'Elvis Bolton'
                ]);

                return $exp
                    ->not($orConditions)
                    ->lte('id', 10);
            });
        dd($query->all());
    }


    // 6. Using SQL functions
    public function useSqlFunction()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp, SelectQuery $q) {
                $year = $q->func()->year(['created' => 'identifier']);

                return $exp
                    ->gte($year, 2020)
                    ->isNotNull('mutation'); // using actual available data
            });
        dd($query->all());
    }


    // 7. LIKE condition
    public function likeCondition()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                return $exp->like('title', '%Qui%');
            });
        dd($query->all());
    }


    // 8. IN condition
    public function inCondition()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                return $exp->in('category_id', [1, 2, 3]);
            });
        dd($query->all());
    }


    // 9. BETWEEN condition
    public function betweenCondition()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp) {
                return $exp->between('id', 8, 15);
            });
        dd($query->all());
    }

    // 10. EXISTS subquery
    public function existsSubquery()
    {
        // Subquery to check for categories named 'Technology'
        $subquery = $this->fetchTable('Categories')->find()
            ->select(['id'])
            ->where(function (QueryExpression $exp, SelectQuery $q) {
                // Match category id with blogs.category_id
                return $exp->equalFields('Categories.id', 'Blogs.category_id');
            })
            ->andWhere(['Categories.name' => 'Technology']);

        // Main query selecting Blogs where the subquery exists
        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp, SelectQuery $q) use ($subquery) {
                return $exp->exists($subquery);
            });

        // Debug SQL and results
        debug($query->sql());
        dd($query->all());
    }


    // 11. NOT EXISTS subquery
    public function notExistsSubquery()
    {
        $subquery = $this->fetchTable('Categories')->find()
            ->select(['id'])
            ->where(function (QueryExpression $exp, SelectQuery $q) {
                return $exp->equalFields('Categories.id', 'Blogs.category_id');
            })
            ->andWhere(['Categories.name' => 'Technology']);

        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp, SelectQuery $q) use ($subquery) {
                return $exp->notExists($subquery);
            });

        dd($query->all());
    }


    // 12. Bound parameters
    public function boundParameters()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->where(['created BETWEEN :start AND :end'])
            ->bind(':start', '2025-05-01', 'date')
            ->bind(':end', '2025-05-31', 'date');

        dd($query->all());
    }

    // 13. Raw field comparison
    public function rawFieldComparison()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->leftJoin(
                ['Categories' => 'categories'],
                ['Blogs.category_id = Categories.id']
            )
            ->where(['Categories.id IS' => null]); // No matching category

        dd($query->all());
    }

    // ---------------Using Identifiers in Expressions-----------
    public function joinWithCategory()
    {
        $query = $this->fetchTable('Blogs')->find()
            ->select(['Blogs.id', 'Blogs.title', 'Categories.name'])
            ->innerJoin(['Categories' => 'categories'], ['Blogs.category_id = Categories.id']);

        dd($query->all());
    }

    // ----------------Collation-------------
    public function searchBlogTitleWithCollation()
    {
        $collation = 'utf8mb4_general_ci'; // ✅ Must match your column charset (utf8mb4)

        $query = $this->fetchTable('Blogs')->find()
            ->where(function (QueryExpression $exp, Query $q) use ($collation) {
                // COLLATE directly on the column via IdentifierExpression
                return $exp->like(
                    new IdentifierExpression("Blogs.title COLLATE $collation"),
                    '%qui%' // Try matching "Qui expedita qui" or "Qui veritatis in..."
                );
            });

        debug($query->sql()); // Show generated SQL
        dd($query->all());    // Dump result
    }

    // ----------Automatically Creating IN Clauses-----------
    public function inClauseWithTypeCasting()
    {
        $categoryIds = [1, 2, 5]; // Example category IDs from your `categories` table

        $query = $this->fetchTable('Blogs')->find()
            ->where(['category_id' => $categoryIds], ['category_id' => 'integer[]']);

        debug($query->sql()); // Show the generated SQL
        dd($query->all());    // Dump result set
    }
    public function inClauseUsingInKeyword()
    {
        $categoryIds = [1, 2, 5];

        $query = $this->fetchTable('Blogs')->find()
            ->where(['category_id IN' => $categoryIds]);

        debug($query->sql());
        dd($query->all());
    }

    // ----------Automatic IS NULL Creation------
    public function isNullOrEqualExample()
    {
        $mutation = null; // Change this to a JSON string like '{"x":100,"y":200}' to test the `= value` branch

        $query = $this->fetchTable('Blogs')->find()
            ->where(['mutation IS' => $mutation]);

        debug($query->sql()); // Outputs: WHERE mutation IS NULL (or mutation = :c0)
        dd($query->all());    // Outputs result
    }

    //-------------- Automatic IS NOT NULL Creation-------
    public function isNotNullOrNotEqualExample()
    {
        $mutation = null; // Change this to '{"x":100,"y":200}' to test the `!=` behavior

        $query = $this->fetchTable('Blogs')->find()
            ->where(['mutation IS NOT' => $mutation]);

        debug($query->sql()); // Shows generated SQL (IS NOT NULL or != :c0)
        dd($query->all());    // Shows matching records
    }

    //----------- Raw Expressions-----------
    public function rawExpressionExample()
    {
        $query = $this->fetchTable('Blogs')->find();

        // Create an expression: LENGTH(title)
        $expr = $query->newExpr()->add('CHAR_LENGTH(title)');

        // Select all blog columns and add a computed column
        $query->select([
            'id',
            'title',
            'title_length' => $expr
        ]);

        debug($query->sql());  // View the raw SQL
        dd($query->all());     // Dump the result with calculated title lengths
    }

    //--------- Using Connection Roles-----------
    public function queryUsingConnectionRoles()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // READ ROLE QUERY
        $readQuery = $blogsTable->find()
            ->useReadRole()
            ->where(['category_id' => 2])
            ->select(['id', 'title', 'author']);

        // debug('READ ROLE SQL:');
        // debug($readQuery->sql());
        debug('READ ROLE RESULT:');
        debug($readQuery->all());

        // WRITE ROLE QUERY
        $writeQuery = $blogsTable->find()
            ->useWriteRole()
            ->where(['category_id' => 1])
            ->select(['id', 'title', 'author']);

        // debug('WRITE ROLE SQL:');
        // debug($writeQuery->sql());
        debug('WRITE ROLE RESULT:');
        dd($writeQuery->all());
    }

    // -----------Expression Conjuction-----------
    public function expressionConjunctionDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find();
        $expr = $query->newExpr(['1', '1'])->setConjunction('+');

        // Simple select using custom conjunction (+)
        $query->select(['two' => $expr]);

        // Example with aggregation: sum of category_id (just as a demo)
        $query->select(function ($query) {
            $sumCategoryId = $query->func()->sum('category_id');

            $totalExpression = $query->newExpr(['category_id', 'id'])
                ->setConjunction('*');  // multiply category_id * id

            return [
                'Blogs.title',
                'sum_category_id' => $sumCategoryId,
                'total_expression' => $query->func()->sum($totalExpression),
            ];
        })
        ->group(['Blogs.id', 'Blogs.title'])
        ->enableAutoFields(true);

        debug($query->sql());
        dd($query->all());
    }

    // ----------Tuple Comparison---------
    public function tupleComparisonDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Example: Find blogs where (category_id, id) <= (2, 3)
        $tupleComparison = new TupleComparison(
            ['category_id', 'id'],
            [2, 3],
            ['integer', 'integer'],
            '<='
        );

        $query = $blogsTable->find()
            ->where($tupleComparison)
            ->select(['id', 'title', 'category_id'])
            ->order(['category_id' => 'ASC', 'id' => 'ASC']);

        debug($query->sql());
        dd($query->all());
    }

    // ------------Getting Results--------
    public function gettingResultsDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Build a basic query to find all blogs with category_id = 1 order by desc
        $query = $blogsTable->find()
            ->where(['category_id' => 1])
            ->order(['created' => 'DESC']);

        // 1. Iterate over the query results
        foreach ($query as $blog) {
            // Just a demonstration - you could process $blog here
            // debug($blog->title);
        }

        // 2. Get all results as a collection
        $allBlogs = $query->all();

        // 3. Use collection methods: map() to get all blog IDs
        $ids = $allBlogs->map(function ($blog) {
            return $blog->id;
        });
        // debug($ids->toList());

        // 4. Use max() to get the latest created timestamp (assuming created is a DateTime)
        $maxCreated = $allBlogs->max(function ($blog) {
            return $blog->created;
        });
        // debug($maxCreated);

        // 5. Get just the first blog (LIMIT 1)
        $firstBlog = $query->first();
        // debug($firstBlog);

        // 6. Get the first blog or throw an exception if none found
        try {
            $firstOrFailBlog = $query->firstOrFail();
            dd($firstOrFailBlog);
        } catch (\Cake\Datasource\Exception\RecordNotFoundException $e) {
            dd('No blog found!');
        }
        
        // Use dd() if you want to stop execution and dump the last value:
        debug($firstOrFailBlog);
    }

    // --------------Returning the Total Count of Records--------
    public function totalCountDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // 1. Count all blogs that have mutation set (i.e., not null)
        $totalWithMutation = $blogsTable->find()
            ->where(['mutation IS NOT' => null])
            ->count();
        debug("Total blogs with mutation: $totalWithMutation");

        // 2. Count blogs for a specific category_id
        $categoryCount = $blogsTable->find()
            ->where(['category_id' => 5])
            ->count();
        debug("Total blogs in category_id = 5: $categoryCount");

        // 3. Grouped count: count how many blogs in each category
        $query = $blogsTable->find();
        $query->select([
            'category_id',
            'blog_count' => $query->func()->count('Blogs.id')
        ])
        ->groupBy(['category_id']);
        $groupedCount = $query->count();
        debug("Number of categories with blogs: $groupedCount");

        // 4. Estimated count (hardcoded for performance or mock use)
        $estimatedQuery = $blogsTable->find()
            ->where(['category_id >' => 0])
            ->counter(function () {
                return 999; // dummy estimate
            });
        $estimated = $estimatedQuery->count();
        debug("Estimated blog count: $estimated");

        // Optional: Still fetch grouped result
        $records = $query->all();
        dd($records);
        // dd('Done');
    }

    // ------------Caching Loaded Results-----------
    public function cacheResultsDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Example 1: Static cache key using default cache config
        $query = $blogsTable->find()
            ->where(['category_id' => 1])
            ->select(['id', 'title', 'category_id'])
            ->cache('blogs_category_1'); // static cache key

        $results1 = $query->all();
        debug('Static cache results:');
        debug($results1);

        // Example 2: Dynamic cache key using a function
        $query2 = $blogsTable->find()
            ->where(['category_id' => 2])
            ->select(['id', 'title', 'category_id'])
            ->cache(function ($q) {
                return 'blogs-dynamic-' . md5(serialize($q->clause('where')));
            });

        $results2 = $query2->all();
        debug('Dynamic cache results:');
        dd($results2);
    }

    // --------------Loading Associations-----------
    public function eagerLoadingDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id',
            ])
            ->contain([
                'Categories' => [
                    'fields' => ['Categories.id', 'Categories.name']
                ],
                'Posts' => [
                    'fields' => ['Posts.id', 'Posts.blog_id', 'Posts.title', 'Posts.created']
                ]
            ])
            ->order(['Blogs.id' => 'ASC']);

        $results = $query->all();

        debug($query->sql());
        dd($results);
    }
    public function eagerLoading()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id',
                'Posts.id',
                'Posts.blog_id',
                'Posts.title',
                'Posts.created'
            ])
            ->innerJoinWith('Posts')
            ->contain(['Categories' => [
                'fields' => ['Categories.id', 'Categories.name']
            ]])
            ->order(['Blogs.id' => 'ASC']);

        $results = $query->all();

        debug($query->sql());
        dd($results);
    }

    // --------------Passing Conditions to Contain----------
    public function containWithConditionsDemo()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id',
            ])
            ->contain([
                'Categories' => function (SelectQuery $q) {
                    // Select all fields from Categories to ensure full entity hydration
                    return $q->enableAutoFields();
                },
                'Posts' => function (SelectQuery $q) {
                    return $q
                        ->select([
                            'Posts.id',
                            'Posts.blog_id',
                            'Posts.title',
                            'Posts.created',
                        ])
                        ->where(['Posts.created >=' => '2025-05-01'])
                        ->order(['Posts.created' => 'DESC']);
                }
            ])
            ->order(['Blogs.id' => 'ASC']);

        // Debug the generated SQL query for Blogs only
        debug($query->sql());

        // Dump results including filtered Posts and full Categories
        dd($query->all());
    }

    // --------------Sorting Contained Associations---------
    public function sortedContain()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id',
            ])
            ->contain([
                'Categories' => function (SelectQuery $q) {
                    return $q->select(['Categories.id', 'Categories.name']);
                },
                'Posts' => [
                    'sort' => ['Posts.created' => 'DESC'],
                    'queryBuilder' => function (SelectQuery $q) {
                        return $q->select(['Posts.id', 'Posts.blog_id', 'Posts.title', 'Posts.created']);
                    }
                ]
            ])
            ->order(['Blogs.id' => 'ASC']);

        debug($query->sql());
        dd($query->all());
    }

    // -------------Filtering by Associated Data--------
    public function filterBlogsWithRecentPosts()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id',
            ])
            ->matching('Posts', function (SelectQuery $q) {
                return $q
                    ->where(['Posts.created >=' => new DateTime('-7 days')])
                    ->select(['Posts.id', 'Posts.blog_id', 'Posts.title', 'Posts.created']);
            })
            ->contain([
                'Categories' => function (SelectQuery $q) {
                    return $q->select(['Categories.id', 'Categories.name']);
                }
            ])
            ->order(['Blogs.id' => 'ASC']);

        debug($query->sql());
        dd($query->all());
    }

    // ---------Using innerJoinWith-----------
    public function filterBlogsWithCategoryJoin()
    {
        $filter = ['Categories.name' => 'Technology'];

        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->distinct(['Blogs.id']) // Needed for proper deduplication
            ->contain('Categories', function (SelectQuery $q) use ($filter) {
                return $q->where($filter);
            })
            ->innerJoinWith('Categories', function (SelectQuery $q) use ($filter) {
                return $q->where($filter);
            })
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id'
            ]);

        debug($query->sql());
        dd($query->all());
    }

    // --------------Using notMatching-----------
    public function filterBlogsWithoutCategory()
    {
        $filter = ['Categories.name' => 'Technology'];

        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find()
            ->notMatching('Categories', function (SelectQuery $q) use ($filter) {
                return $q->where($filter);
            })
            ->select([
                'Blogs.id',
                'Blogs.title',
                'Blogs.category_id'
            ]);

        debug($query->sql());
        dd($query->all());
    }

    // -------------Using leftJoinWith------------
    public function countPostsPerBlog()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find();

        $query->select([
                'Blogs.id',
                'Blogs.title',
                'total_posts' => $query->func()->count('Posts.id')
            ])
            ->leftJoinWith('Posts') // valid association
            ->groupBy(['Blogs.id'])
            ->enableAutoFields(true);

        debug($query->sql());
        dd($query->all());
    }

    // -----------Adding Joins------------
    public function joinExample()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find();

        $query->join([
            'Categories' => [
                'table' => 'categories',
                'type' => 'INNER',
                'conditions' => 'Categories.id = Blogs.category_id',
            ]
        ]);

        $query->select([
            'Blogs.id',
            'Blogs.title',
            'Categories.name'
        ])
        ->group(['Blogs.id', 'Blogs.title', 'Categories.name']);

        debug($query->sql());
        $results = $query->all();

        debug($results->toArray());
        exit; // stop further rendering for debugging
    }
    public function leftJoinExample()
    {
        $blogsTable = $this->fetchTable('Blogs');
        $query = $blogsTable->find();

        $query->leftJoin(
            ['Categories' => 'categories'],
            ['Categories.id = Blogs.category_id']
        );

        $query->select([
            'Blogs.id',
            'Blogs.title',
            'Categories.name'
        ]);

        debug($query->sql());
        dd($query->all());
    }
    public function joinWithTypedConditions()
    {
        $blogsTable = $this->fetchTable('Blogs');

        // Format DateTime as string for SQL query
        $dateLimit = (new \DateTime('-30 days'))->format('Y-m-d H:i:s');

        $query = $blogsTable->find();

        $query->innerJoin(
            ['c' => 'categories'],
            ['c.id = Blogs.category_id']
        );

        // Add condition as string date
        $query->where([
            'c.created >=' => $dateLimit,
        ]);

        $query->select([
            'Blogs.id',
            'Blogs.title',
            'c.name'
        ]);

        debug($query->sql());
        dd($query->all());
    }
    public function joinWithIdentifier()
    {
        $blogsTable = $this->fetchTable('Blogs');

        $query = $blogsTable->find();

        $query->join([
            'c' => [
                'table' => 'categories',
                'type' => 'LEFT',
                'conditions' => [
                    'c.id' => new IdentifierExpression('Blogs.category_id'),
                ],
            ],
        ]);

        $query->select([
            'Blogs.id',
            'Blogs.title',
            'c.name',
        ]);

        debug($query->sql());
        dd($query->all());
    }

    // -----------Inserting Data-----------
    public function addBlogPosts()
    {
        // Get the blogs table instance
        $blogs = $this->getTableLocator()->get('Blogs');

        // Prepare the insert query
        $query = $blogs->insertQuery();

        // Insert multiple rows using values() chained
        $query->insert([
            'title', 
            'content', 
            'author', 
            'created', 
            'modified', 
            'mutation', 
            'category_id'
        ])
        ->values([
            'title' => 'New Blog Post 1',
            'content' => 'Content for new blog post 1',
            'author' => 'Author One',
            'created' => date('Y-m-d H:i:s'),
            'modified' => date('Y-m-d H:i:s'),
            'mutation' => null,
            'category_id' => 1
        ])
        ->values([
            'title' => 'New Blog Post 2',
            'content' => 'Content for new blog post 2',
            'author' => 'Author Two',
            'created' => date('Y-m-d H:i:s'),
            'modified' => date('Y-m-d H:i:s'),
            'mutation' => json_encode(['x' => 50, 'y' => 150]),
            'category_id' => 2
        ]);

        // Execute the query
        $result = $query->execute();

        // Debug the result using dd()
        dd($result);
    }

    // ----------Updating Data----------
    public function updateBlog()
    {
        // Get the Blogs table instance
        $blogs = $this->getTableLocator()->get('Blogs');

        // Create an update query
        $query = $blogs->updateQuery();

        // Update a specific blog with id = 5 (you can change this)
        $query->set([
                'title' => 'Updated Blog Title',
                'content' => 'Updated content here',
                'modified' => date('Y-m-d H:i:s'),
                'mutation' => json_encode(['x' => 999, 'y' => 888])
            ])
            ->where(['id' => 5]);

        // Execute the query
        $result = $query->execute();

        // Debug the result
        dd($result);
    }

    // ---------Deleting Data--------
    public function deleteBlog()
    {
        $posts = $this->getTableLocator()->get('Posts');
        $blogs = $this->getTableLocator()->get('Blogs');

        // Step 1: Delete posts with blog_id = 8
        $posts->deleteQuery()
            ->where(['blog_id' => 8])
            ->execute();

        // Step 2: Delete the blog
        $result = $blogs->deleteQuery()
            ->where(['id' => 8])
            ->execute();

        dd($result);
    }

    // -------SQL Injection Prevention-----------
    public function safeSearchBlog()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        $userInput = 'Mollit'; // Example search term

        $query = $blogs->find()
            ->where(function (QueryExpression $exp, Query $q) use ($userInput) {
                return $exp->like('title', '%' . $userInput . '%');
            });

        // Fetch all results as an array
        $results = $query->all()->toArray();

        // Dump SQL, params, and results for debugging
        debug($query->sql());
        dd([
            // 'params' => $query->getValueBinder()->bindings(),
            'results' => $results,
        ]);
    }

    // ------------Binding values---------------
    public function searchBlogsWithBindings()
    {
        $blogsTable = $this->getTableLocator()->get('Blogs');

        // Example user inputs
        $searchTerm = 'Mollit';
        $dateLimit = new \DateTime();

        $query = $blogsTable->find()
            ->select(['id', 'title', 'content', 'author', 'created'])
            ->where([
                'Blogs.title LIKE :searchTerm',
                'Blogs.created <= :dateLimit'
            ])
            ->bind(':searchTerm', '%' . $searchTerm . '%', 'string')
            ->bind(':dateLimit', $dateLimit->format('Y-m-d H:i:s'), 'datetime');

        $results = $query->all()->toArray();

        debug($query->sql());
        dd([
            // 'params' => $query->getValueBinder()->bindings(),
            'results' => $results,
        ]);
    }

    // ---------Unions-----------
    public function unionExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // First query: blogs from category_id = 1
        $categoryOneBlogs = $blogs->find()
            ->select(['id', 'title', 'author', 'created'])
            ->where(['category_id' => 1]);

        // Second query: blogs from category_id = 2
        $categoryTwoBlogs = $blogs->find()
            ->select(['id', 'title', 'author', 'created'])
            ->where(['category_id' => 2]);

        // Combine with UNION (removes duplicates)
        $unionQuery = $categoryTwoBlogs->union($categoryOneBlogs);

        // Get results
        $results = $unionQuery->all()->toArray();

        debug($unionQuery->sql());
        dd( $results);
    }
    public function unionAllExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // First query: blogs from category_id = 1
        $categoryOneBlogs = $blogs->find()
            ->select(['id', 'title', 'author', 'created'])
            ->where(['category_id' => 1]);

        // Second query: blogs from category_id = 2
        $categoryTwoBlogs = $blogs->find()
            ->select(['id', 'title', 'author', 'created'])
            ->where(['category_id' => 2]);

        // Combine with UNION ALL (keeps duplicates)
        $unionAllQuery = $categoryTwoBlogs->unionAll($categoryOneBlogs);

        // Get results
        $results = $unionAllQuery->all()->toArray();

        debug($unionAllQuery->sql());
        dd($results);
    }

    // -----------Intersections------------
    public function intersectExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        $query = $blogs->find()
            ->select(['id', 'title', 'author', 'created'])
            ->where([
                'author' => 'lorem'
            ]);

        $results = $query->all()->toArray();

        debug($query->sql());
        dd($results);
    }
    public function intersectAllExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // First query: Get blog IDs authored by 'lorem'
        $byAuthor = $blogs->find()
            ->select(['id'])
            ->where(['author' => 'lorem'])
            ->enableHydration(false)
            ->all(); // Converts to ResultSetInterface

        $byAuthorIds = (new Collection($byAuthor))->extract('id')->toList();

        // Second query: Get blog IDs created in the last 30 days
        $recent = $blogs->find()
            ->select(['id'])
            ->where(['created >' => new \DateTime('-30 days')])
            ->enableHydration(false)
            ->all();

        $recentIds = (new Collection($recent))->extract('id')->toList();

        // Manual intersection of IDs
        $intersectIds = array_values(array_intersect($byAuthorIds, $recentIds));

        // Get full blog data for intersected IDs
        $results = $blogs->find()
            ->where(['id IN' => $intersectIds])
            ->toArray();

        dd($results);
    }

    // -------------Subqueries----------
    public function subqueryExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');
        $categories = $this->getTableLocator()->get('Categories');

        // Step 1: Create a subquery selecting category IDs with name like 'Tech'
        $matchingCategory = $categories->find()
            ->select(['id'])
            ->distinct()
            ->where(['name LIKE' => '%Tech%']);

        // Step 2: Main query - Get blogs where category_id is in the subquery
        $query = $blogs->find()
            ->where(['category_id IN' => $matchingCategory]);

        // Step 3: Fetch and debug the results
        $results = $query->all()->toArray();

        debug($query->sql());
        dd($results);
    }

    // ----------Adding Locking Statements---------
    public function lockExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // Query with a lock (FOR UPDATE) - useful in transactional updates
        $query = $blogs->find()
            ->where(['author' => 'lorem'])
            ->epilog('FOR UPDATE'); // Appends "FOR UPDATE" to the SQL

        $results = $query->all()->toArray();

        debug($query->sql());
        dd($results);
    }

    // -----------Window Functions-----------
    public function windowFunctionExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // Define a named window for partitioning by category_id
        $query = $blogs->find();

        $query->window('per_category', function ($window, $query) {
            $window->partition('Blogs.category_id');
            return $window;
        });

        // Select fields and add window functions
        $query->select([
            'Blogs.id',
            'Blogs.title',
            'Blogs.category_id',
            'Blogs.author',
            'created',
            'oldest_post' => $query->func()
                ->min('Blogs.created')
                ->over('per_category'),
            'latest_post' => $query->func()
                ->max('Blogs.created')
                ->over('per_category'),
        ]);

        $results = $query->all()->toArray();

        debug($query->sql());
        dd($results);
    }

    // ------------Common Table Expressions--------
    public function cteExample()
    {
        $blogs = $this->getTableLocator()->get('Blogs');

        // Base query
        $query = $blogs->find();

        // Attach a Common Table Expression (CTE)
        $query->with(function ($cte) use ($blogs) {
            // Subquery: count of blogs per author
            $q = $blogs->subquery();
            $q->select([
                'blog_count' => $q->func()->count('*'),
                'author',
            ])
            ->groupBy('author');

            // Return CTE
            return $cte
                ->name('blogs_per_author')
                ->query($q);
        });

        // Final select with join on CTE
        $query->select([
            'Blogs.title',
            'Blogs.author',
            'blog_count' => 'blogs_per_author.blog_count',
        ])
        ->join([
            'blogs_per_author' => [
                'table' => 'blogs_per_author',
                'conditions' => 'blogs_per_author.author = Blogs.author',
            ],
        ]);

        // Output results and SQL
        $results = $query->all()->toArray();
        debug($query->sql());
        dd($results);
    }

    // ---------------Behavior------------
    public function testBehavior(): void
    {
        $blogsTable = $this->fetchTable('Blogs');
        $behavior = $blogsTable->behaviors()->get('BlogFormat');

        $slug = $behavior->generateSlug('Test Title For Slug!');
        
        dd([
            'input' => 'Test Title For Slug!',
            'output_slug' => $slug
        ]);
    }
    public function slugBehavior()
    {
        $slug = $this->Blogs->superSlug('Hello World Slug Test');
        dd($slug); // ✅ Will print 'hello-world-slug-test'
    }
    public function testCounterCache()
    {
        $blogsTable = TableRegistry::getTableLocator()->get('Blogs');
        $categoriesTable = TableRegistry::getTableLocator()->get('Categories');

        $blog = $blogsTable->newEmptyEntity();
        $blog->title = 'Test Blog ' . date('H:i:s');
        $blog->content = 'This is a test content';
        $blog->author = 'Test Author';
        $blog->status = 'published';
        $blog->is_featured = true;
        $blog->rating = 4.7;
        $blog->category_id = 1;

        if ($blogsTable->save($blog)) {
            try {
                $category = $categoriesTable->get($blog->category_id);
                dd($category);
            } catch (RecordNotFoundException $e) {
                dd('Category not found');
            }
        } else {
            dd($blog->getErrors());
        }
    }
    public function testTimestamp()
    {
        // You do NOT need to call $this->loadModel('Blogs') here
        // Because when the controller name matches the model, Cake loads the model automatically.

        // Create new blog entity
        $blog = $this->Blogs->newEmptyEntity();

        $blog->title = 'Test Blog ' . date('H:i:s');
        $blog->content = 'This is a test content for the blog.';
        $blog->author = 'Test Author';
        $blog->category_id = 1;  // Assume category 1 exists
        $blog->slug = 'test-blog-' . date('His');

        if ($this->Blogs->save($blog)) {
            dd($blog);
        } else {
            dd($blog->getErrors());
        }
    }
    public function testTranslate()
    {
        // Set locale to French or any locale you want
        I18n::setLocale('fr_FR');

        // Get the Blogs table
        $blogs = TableRegistry::getTableLocator()->get('Blogs');

        try {
            // Get blog with id=2 (no translations expected)
            $blog = $blogs->get(1);
        } catch (RecordNotFoundException $e) {
            throw new NotFoundException('Blog not found.');
        }

        // Dump the blog entity, will show default content if no translation exists
        dd($blog);
    }

    // -------------Debugging------------
    public function debugPlain()
    {
        // Disable auto-rendering and layout
        $this->autoRender = false;
        $this->viewBuilder()->disableAutoLayout();

        // Set content type via Response object
        $this->response = $this->response->withType('text/plain');

        // Prepare your data
        $data = ['apple', 'banana', 'cherry'];

        // Dump the data (plain text)
        Debugger::dump($data);

        // Stop script execution so no other output is sent
        exit;
    }


    /**
     * View method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $blog = $this->Blogs->get($id, contain: ['Posts']);
        $this->set(compact('blog'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    // public function add()
    // {
    //     $blog = $this->Blogs->newEmptyEntity();
    //     if ($this->request->is('post')) {
    //         $blog = $this->Blogs->patchEntity($blog, $this->request->getData());
    //         if ($this->Blogs->save($blog)) {
    //             $this->Flash->success(__('The blog has been saved.'));

    //             return $this->redirect(['action' => 'index']);
    //         }
    //         $this->Flash->error(__('The blog could not be saved. Please, try again.'));
    //     }
    //     $this->set(compact('blog'));
    // }
    public function add()
{
    $blog = $this->Blogs->newEmptyEntity();
    if ($this->request->is('post')) {
        $blog = $this->Blogs->patchEntity($blog, $this->request->getData());

        // Add mutation data here (example)
        $blog->mutation = ['x' => 100, 'y' => 200];

        if ($this->Blogs->save($blog)) {
            $this->Flash->success(__('The blog has been saved.'));

            return $this->redirect(['action' => 'index']);
        }
        $this->Flash->error(__('The blog could not be saved. Please, try again.'));
    }
    $this->set(compact('blog'));
}

    /**
     * Edit method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $blog = $this->Blogs->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $blog = $this->Blogs->patchEntity($blog, $this->request->getData());
            if ($this->Blogs->save($blog)) {
                $this->Flash->success(__('The blog has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The blog could not be saved. Please, try again.'));
        }
        $this->set(compact('blog'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Blog id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $blog = $this->Blogs->get($id);
        if ($this->Blogs->delete($blog)) {
            $this->Flash->success(__('The blog has been deleted.'));
        } else {
            $this->Flash->error(__('The blog could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}

