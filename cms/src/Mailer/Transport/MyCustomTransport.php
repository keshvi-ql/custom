<?php

namespace App\Mailer\Transport;

use Cake\Mailer\AbstractTransport;
use Cake\Mailer\Message;

class MyCustomTransport extends AbstractTransport
{
    public function send(Message $message): array
    {
        // Example: send using custom API
        $to = $message->getTo();
        $subject = $message->getSubject();
        $body = $message->getBodyString();

        // Your custom logic (e.g., call an API or log locally)
        // Simulate sending:
        file_put_contents(TMP . 'email_log.txt', "To: " . key($to) . "\nSubject: $subject\n\n$body");

        return [
            'headers' => $message->getHeadersString(),
            'message' => $body,
        ];
    }
}
