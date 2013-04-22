var page = require('webpage').create(),
    system = require('system'),
    t, address;

if (system.args.length === 1)
{
    console.log('Usage: loadspeed.js <some URL>');
    phantom.exit(1);
}
else
{
    address = system.args[1];

    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('FAIL to load the address');
        }
        else
        {
            var html = page.evaluate(function () {
                var root = document.getElementsByTagName("html")[0];
                var html = root ? root.outerHTML : document.body.innerHTML;
                return html
            });
            console.log(html);
            phantom.exit();
        }
    });
}
