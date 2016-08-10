#### SETTINGS #########
# apt-get install wkhtmltopdf
# apt-get install xvfb
# echo 'xvfb-run --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf $*' > /usr/bin/wkhtmltopdf.sh
# chmod a+rx /usr/bin/wkhtmltopdf.sh
# ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf
# wkhtmltopdf http://www.google.com output.pdf

WickedPdf.config = {
  wkhtmltopdf: '/usr/local/bin/wkhtmltopdf',
  layout: 'pdf.html'
}
