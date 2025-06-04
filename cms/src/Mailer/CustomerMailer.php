<?php
declare(strict_types=1);

namespace App\Mailer;

use Cake\Mailer\Mailer;

class CustomerMailer extends Mailer
{
    public function welcome($customer)
    {
        $this
            ->setTo($customer->email)
            ->setSubject('Welcome to MyApp!')
            ->setEmailFormat('html')
            ->setViewVars(['name' => $customer->name])
            ->viewBuilder()
                ->setTemplate('welcome') // file: templates/email/html/welcome.php
                ->setLayout('default');  // file: templates/layout/email/html/default.php
    }


}
