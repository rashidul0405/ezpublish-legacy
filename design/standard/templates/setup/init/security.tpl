{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<form method="post" action="{$script}">

<div align="center">
  <h1>{"Site security"|i18n("design/standard/setup/init")}</h1>
</div>

<p>
{"Your site is not running in a virtual host mode, this is insecure. It is recommended to run eZ Publish in virtual host mode. If you do not have the possibility to use virtual host mode, you should follow the instructions below about how to install an .htaccess file. The .htaccess file tells the web server to restrict the access to certain files."|i18n("design/standard/setup/init")}
</p>

<p>
  {"If you have shell access, you can run the following commands."|i18n("design/standard/setup/init")}
</p>
<pre class="example">cd {$path}
cp .htaccess_root .htaccess</pre>
<p>
  {"If you do not have shell access, you will have to copy the file using an FTP client or ask your hosting provider to do this for you."|i18n("design/standard/setup/init")}
</p>

  {include uri='design:setup/init/navigation.tpl'}
  {include uri="design:setup/persistence.tpl"}

</form>
