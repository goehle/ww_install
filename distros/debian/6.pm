package debian;

$prerequisites =
{
  common => {
    mkdir => 'coreutils',
    mv => 'coreutils',
    gcc => 'gcc',
    make => 'make',
    tar => 'tar',
    gzip => 'gzip',
    unzip => 'unzip',
    dvipng => 'dvipng',
    netpbm => 'netpbm',  #provides giftopnm, ppmtopgm, pnmtops, pnmtopng, 
                        #and pgntopnm
    git => 'git',
    svn => 'subversion',

    apache2 => 'apache2',
    mysql => 'mysql-client',
    mysql_server => 'mysql-server',
    ssh_server => 'openssh-server',

    preview_latex => 'preview-latex-style',
    texlive => 'texlive-latex-base', 
    'Apache2::Request' => 'libapache2-request-perl',
    'Apache2::Cookie' => 'libapache2-request-perl',
    'Apache2::ServerRec' => 'libapache2-mod-perl2',
    'Apache2::ServerUtil' => 'libapache2-mod-perl2',
    'Benchmark' => 'perl-modules',
    'Carp' => 'perl-base',
    'CGI' => 'perl-modules',
    'Data::Dumper' => 'perl',
    'Data::UUID' => 'libossp-uuid-perl',
    'Date::Format' => 'libtimedate-perl',
    'Date::Parse' => 'libtimedate-perl',
    'DateTime' => 'libdatetime-perl',
    'DBD::mysql' => 'libdbd-mysql-perl',
    'DBI' => 'libdbi-perl',
    'Digest::MD5' => 'perl',
    'Email::Address' => 'libemail-address-perl',
    'Errno' => 'perl-base',
    'Exception::Class' => 'libexception-class-perl',
    'ExtUtils::XSBuilder' => 'libextutils-xsbuilder-perl',
    'File::Copy' => 'perl-modules',
    'File::Find' => 'perl-modules',
    'File::Find::Rule' => 'libfile-find-rule-perl',
    'File::Path' => 'perl-modules',
    'File::Spec' => 'perl-modules',
    'File::stat' => 'perl-modules',
    'File::Temp' => 'perl-modules',
    'GD' => 'libgd-gd2-perl',
    'Getopt::Long' => 'perl-base',
    'Getopt::Std' => 'perl-modules',
    'HTML::Entities' => '',
    'HTML::Scrubber' => 'libhtml-scrubber-perl',
    'HTML::Tagset' => '',
    'HTML::Template' => 'CPAN',
    'IO::File' => '',
    'Iterator' => 'CPAN',
    'Iterator::Util' => 'CPAN',
    'JSON' => 'libjson-perl',
    'Locale::Maketext::Lexicon' => 'liblocale-maketext-lexicon-perl',
    'Locale::Maketext::Simple' => '',
    'Mail::Sender' => 'libmail-sender-perl',
    'MIME::Base64' => 'libmime-tools-perl',
    'Net::IP' => 'libnet-ip-perl',
    'Net::LDAPS' => 'libnet-ldap-perl',
    'Net::OAuth' => 'libnet-oauth-perl',
    'Net::SMTP' => 'perl-modules',
    'Opcode' => 'perl',
    'PadWalker' => 'libpadwalker-perl',
    'PHP::Serialization' => 'libphp-serialization-perl',
    'Pod::Usage' => 'perl-modules',
    'Pod::WSDL' => 'libpod-wsdl-perl',
    'Safe' => 'perl-modules',
    'Scalar::Util' => 'perl-base',
    'SOAP::Lite' => 'libsoap-lite-perl',
    'Socket' => 'perl-base',
    'SQL::Abstract' => 'libsql-abstract-perl',
    'String::ShellQuote' => 'libstring-shellquote-perl',
    'Text::CSV' => 'libtext-csv-perl',
    'Text::Wrap' => 'perl-base',
    'Tie::IxHash' => 'libtie-ixhash-perl',
    'Time::HiRes' => 'perl',
    'Time::Zone' => 'libtimedate-perl',
    'URI::Escape' => 'liburi-perl',
    'UUID::Tiny' => 'libuuid-tiny-perl',
    'XML::Parser' => 'libxml-parser-perl',
    'XML::Parser::EasyTree' => 'CPAN',
    'XML::Writer' => 'libxml-writer-perl',
    'XMLRPC::Lite' => 'libsoap-lite-perl',
  },
};

1;

sub edit_sources_list {
  #make sure we don't try to get anything off of 
  #a cdrom. (Allowing it causes script to hang 
  # on Debian 7)
  #sed -i -e 's/deb cdrom/#deb cdrom/g' /etc/apt/sources.list
  my $sources_list = shift;
  backup_file($sources_list);
  my $string = slurp_file($sources_list);
  open(my $new,'>',$sources_list);
  $string =~ s/deb\s+cdrom/#deb cdrom/g;
  print $new $string;
  print_and_log("Modified $sources_list to remove cdrom from list of package repositories.");
}