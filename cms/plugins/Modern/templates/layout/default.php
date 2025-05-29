<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>Modern Theme</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <!-- Bootstrap CSS (CDN) -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

   <!-- Optional: Font Awesome Icons -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-" crossorigin="anonymous" referrerpolicy="no-referrer" />

   <?= $this->fetch('meta') ?>
   <?= $this->fetch('css') ?>
   <?= $this->fetch('script') ?>
</head>
<body>

   <!-- Navigation -->
   <!-- <nav class="navbar fixed-top navbar-expand-lg navbar-dark "> -->

         <a class="navbar-brand" href="<?= $this->Url->build('/') ?>">
               <i class="fas fa-globe"></i> Modern Theme
         </a>

   <!-- Main content -->

   <?= $this->fetch('content') ?>


   <!-- Footer -->
   <footer>
      <small>&copy; <?= date('Y') ?> Modern Theme | All Rights Reserved.</small>
   </footer>

   <!-- Bootstrap JS (Optional for interactivity) -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
