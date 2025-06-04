<?php
declare(strict_types=1);

namespace App\Controller;

use Cake\Event\EventInterface;
use function Cake\I18n\toDate;
/**
 * Customers Controller
 *
 * @property \App\Model\Table\CustomersTable $Customers
 */
class CustomersController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function beforeRender(EventInterface $event)
    {
        $this->viewBuilder()->setTheme('Modern');
    }

    public function index()
    {
        // env
        // $host = $this->request->getEnv('HTTP_HOST');
        // dd($host);

        // Checking Request Conditions
        // $isPost = $this->request->is('post');
        // dd($isPost);
        // $this->request->addDetector('post', [
        //     'env' => 'REQUEST_METHOD',
        //     'value' => 'POST'
        // ]);
        // $this->request->addDetector('iphone', [
        //     'env' => 'HTTP_USER_AGENT',
        //     'pattern' => '/iPhone/i'
        // ]);
        // $this->request->addDetector('internalIp', [
        //     'env' => 'CLIENT_IP',
        //     'options' => ['192.168.0.101', '192.168.0.100']
        // ]);
        // $this->request->addDetector('fancy', [
        //     'env' => 'CLIENT_IP',
        //     'header' => ['X-Fancy' => 1]
        // ]);
        // $this->request->addDetector('fancyCustom', [
        //     'env' => 'CLIENT_IP',
        //     'header' => ['X-Fancy' => function ($value, $header) {
        //         return in_array($value, ['1', '0', 'yes', 'no'], true);
        //     }]
        // ]);
        // $this->request->addDetector('awesome', function ($request) {
        //     return (bool)$request->getParam('awesome');
        // });
        // $this->request->addDetector('csv', [
        //     'accept' => ['text/csv'],
        //     'param' => '_ext',
        //     'value' => 'csv'
        // ]);
        // dd([
        //     'isPost' => $this->request->is('post'),
        //     'isIphone' => $this->request->is('iphone'),
        //     'isInternalIp' => $this->request->is('internalIp'),
        //     'isFancy' => $this->request->is('fancy'),
        //     'isFancyCustom' => $this->request->is('fancyCustom'),
        //     'isAwesome' => $this->request->is('awesome'),
        //     'isCsv' => $this->request->is('csv'),
        // ]);

        // Reading the HTTP Method
        // $method = $this->request->getMethod();
        // dd([
        //     'HTTP Method Used' => $method
        // ]);
        // Normal functionality (won't be reached due to dd above)
        $query = $this->Customers->find();
        $customers = $this->paginate($query);
        $this->set(compact('customers'));
    }

    /**
     * View method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
// Possibly in CustomersController.php
// public function view($id = null)
// {
//     $customer = $this->Customers->get($id);
//     $this->set(compact('customer'));
// }

    public function view($id = null)
    {
    $customer = $this->Customers->get($id);

    $requestTarget = $this->request->getRequestTarget(); 
    $base = $this->request->getAttribute('base');         
    $webroot = $this->request->getAttribute('webroot');

    // path information
    // dd([
    //     'requestTarget' => $requestTarget,
    //     'base' => $base,
    //     'webroot' => $webroot
    // ]);

    $this->set(compact('customer'));
    $this->set('breadcrumbs', [
    ['title' => 'Home', 'url' => ['controller' => 'vlog', 'action' =>  'home']],
    ['title' => 'Customers', 'url' => ['controller' => 'Customers', 'action' => 'index']],
    ['title' => 'View Customer']
]);

    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        // env
        // $env = $this->request->getServerParams();
        // dd($env);

        $customer = $this->Customers->newEmptyEntity();
        if ($this->request->is('post')) {
            $customer = $this->Customers->patchEntity($customer, $this->request->getData());
            if ($this->Customers->save($customer)) {
                $this->Flash->success(__('The customer has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The customer could not be saved. Please, try again.'));
        }
        $this->set(compact('customer'));
    }
    /**
     * Edit method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $customer = $this->Customers->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $customer = $this->Customers->patchEntity($customer, $this->request->getData());
            if ($this->Customers->save($customer)) {
                $this->Flash->success(__('The customer has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The customer could not be saved. Please, try again.'));
        }
        $this->set(compact('customer'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        // Restricting Which HTTP method an Action Accepts
        $this->request->allowMethod(['post', 'delete']);
        $customer = $this->Customers->get($id);
        if ($this->Customers->delete($customer)) {
            $this->Flash->success(__('The customer has been deleted.'));
        } else {
            $this->Flash->error(__('The customer could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
    
    // Host and Domain Name
    public function host()
    {
        $request = $this->request;

        $domain = $request->domain(); // e.g., 'example.org'
        $subdomains = $request->subdomains(); // e.g., ['my', 'dev']
        $host = $request->host(); // e.g., 'my.dev.example.org'

        // For debugging / output
        dd([
            'Domain' => $domain,
            'Subdomains' => $subdomains,
            'Host' => $host
        ]);
    }

    // Session Data
    public function session()
    {
        // Method 1: Get session using getSession()
        $session1 = $this->request->getSession();
        $value1 = $session1->read('sessionKey');

        // Method 2: Get session using getAttribute (alternative)
        $session2 = $this->request->getAttribute('session');
        $value2 = $session2 ? $session2->read('sessionKey') : null;

        // Output for debugging session values
        dd([
            'Using getSession()' => $value1,
            'Using getAttribute("session")' => $value2,
        ]);
    }

    // Reading HTTP Headers
    public function header()
    {
        // Get the User-Agent header as a string
        $userAgent = $this->request->getHeaderLine('User-Agent');

        // Get all Accept headers as an array
        $acceptHeader = $this->request->getHeader('Accept');

        // Check if Accept header exists
        $hasAcceptHeader = $this->request->hasHeader('Accept');

        // Get the referer URL (where the request came from)
        $referer = $this->request->referer(true); // true to get local referer only

        // Get the client's IP address
        $clientIp = $this->request->clientIp();

        // Dump all data for debugging
        dd([
            'User-Agent' => $userAgent,
            'Accept Header' => $acceptHeader,
            'Has Accept Header?' => $hasAcceptHeader,
            'Referer' => $referer,
            'Client IP' => $clientIp,
        ]);
    }

    // Checking Accept Headers
    public function headerInfo()
    {
        // Get the User-Agent header as a string
        $userAgent = $this->request->getHeaderLine('User-Agent');

        // Get all Accept headers as an array
        $acceptHeader = $this->request->getHeader('Accept');

        // Check if Accept header exists
        $hasAcceptHeader = $this->request->hasHeader('Accept');

        // Get the referer URL (where the request came from)
        $referer = $this->request->referer(true); // true to get local referer only

        // Get the client's IP address
        $clientIp = $this->request->clientIp();

        // Get all accepted content types from the client
        $accepts = $this->request->accepts();

        // Check if client accepts JSON
        $acceptsJson = $this->request->accepts('application/json');

        // Get all accepted languages
        $acceptLanguages = $this->request->acceptLanguage();

        // Check if client accepts Spanish (es-es)
        $acceptsSpanish = $this->request->acceptLanguage('es-es');

        // Dump all data for debugging
        dd([
            'User-Agent' => $userAgent,
            'Accept Header' => $acceptHeader,
            'Has Accept Header?' => $hasAcceptHeader,
            'Referer' => $referer,
            'Client IP' => $clientIp,
            'Accepts (all types)' => $accepts,
            'Accepts JSON?' => $acceptsJson,
            'Accept Languages' => $acceptLanguages,
            'Accepts Spanish?' => $acceptsSpanish,
        ]);
    }

    // Trusting Proxy Headers
    public function proxyInfo()
    {
        // Trust proxy headers like X-Forwarded-For, X-Forwarded-Host, etc.
        $this->request->trustProxy = true;

        // Optionally specify trusted proxy IP addresses
        // $this->request->setTrustedProxies(['127.1.1.1', '127.8.1.3']);

        // Now these methods will use proxy headers if present
        $port = $this->request->port();
        $host = $this->request->host();
        $scheme = $this->request->scheme();
        $clientIp = $this->request->clientIp();

        // Debug the values to see the output
        debug(compact('port', 'host', 'scheme', 'clientIp'));
        die();
    }

    // Reading Cookies
    public function cookieInfo()
    {
        // Get a specific cookie value, or null if not found
        $rememberMe = $this->request->getCookie('remember_me');

        // Use a string as the default value
        $rememberMeDefault = $this->request->getCookie('remember_me', '0');

        // Get all cookies as an associative array
        $allCookies = $this->request->getCookieParams();

        // Get the CookieCollection instance
        $cookieCollection = $this->request->getCookieCollection();

        // Dump the results
        dd([
            'Remember Me Cookie (nullable)' => $rememberMe,
            'Remember Me Cookie (default "0")' => $rememberMeDefault,
            'All Cookies' => $allCookies,
            'Cookie Collection' => $cookieCollection
        ]);
    }

    // Uploaded Files
    public function uploadFile()
    {
        if ($this->request->is('post')) {
            // Get all uploaded files as an array of UploadedFileInterface objects
            $files = $this->request->getUploadedFiles();
            dd($files); // Dump all uploaded files and stop

            // For example, if you expect a file input named 'profile_picture'
            if (!empty($files['profile_picture'])) {
                $file = $files['profile_picture'];
                dd($file);// Dump the single uploaded file object and stop

                // Read file data
                $size = $file->getSize();
                $clientFilename = $file->getClientFileName();
                dd(compact('size', 'clientFilename')); // Dump size and filename and stop

                // Define the target directory and make sure it exists
                $uploadDir = WWW_ROOT . 'uploads' . DS;
                if (!is_dir($uploadDir)) {
                    mkdir($uploadDir, 0775, true);  // recursive mkdir with permissions
                }

                // Define the full target path
                $targetPath = $uploadDir . $clientFilename;
                dd($targetPath);// Dump the target path and stop

                // Move the uploaded file to the target directory
                $file->moveTo($targetPath);

                $this->Flash->success(__('File uploaded successfully: {0} ({1} bytes)', $clientFilename, $size));
            } else {
                $this->Flash->error(__('No file was uploaded.'));
            }
        }
    }

    // Manipulating URIs
    public function showUri()
    {
        // Get the URI object from the request
        $uri = $this->request->getUri();

        // Extract parts of the URI
        $path = $uri->getPath();
        $query = $uri->getQuery();
        $host = $uri->getHost();

        // Debug the URI parts for inspection
        debug(compact('path', 'query', 'host'));
        die(); // Stop execution to see the output
    }

    // ---------------------Behavior ------------
    public function testBehavior()
    {
        $customer = $this->Customers->newEmptyEntity();
        $customer = $this->Customers->patchEntity($customer, [
            'name' => 'Example Customer Name'
        ]);

        $result = $this->Customers->behaviors()->BlogFormat->formatBlog($customer);

        dd($result);
    }


}
