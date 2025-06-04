<?php
namespace App\Mailer;

use Cake\Mailer\Mailer;

class UserMailer extends Mailer
{
    public function welcome($user)
    {
        $this
            ->setTo($user->email)
            ->setSubject('Welcome to MyApp')
            ->setEmailFormat('html') // or 'text'
            ->setViewVars(['username' => $user->username])
            ->setTemplate('welcome'); // email template name
    }
}
