<?php
declare(strict_types=1);

namespace App\Test\TestCase\Model\Table;

use App\Model\Table\BlogsTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\BlogsTable Test Case
 */
class BlogsTableTest extends TestCase
{
    /**
     * Test subject
     *
     * @var \App\Model\Table\BlogsTable
     */
    protected $Blogs;

    /**
     * Fixtures
     *
     * @var list<string>
     */
    protected array $fixtures = [
        'app.Blogs',
        'app.Posts',
    ];

    /**
     * setUp method
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();
        $config = $this->getTableLocator()->exists('Blogs') ? [] : ['className' => BlogsTable::class];
        $this->Blogs = $this->getTableLocator()->get('Blogs', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    protected function tearDown(): void
    {
        unset($this->Blogs);

        parent::tearDown();
    }

    /**
     * Test validationDefault method
     *
     * @return void
     * @uses \App\Model\Table\BlogsTable::validationDefault()
     */
    public function testValidationDefault(): void
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
