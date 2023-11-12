# A. Hesham : fix problem on wp-settings.php file, by atomating replace .phpp with .php, then 500 error will be solved
exec { 'fix wp-settings typo':
  command     => "/bin/sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
}
