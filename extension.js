var pjson = require('./package.json'),
    debug = require('debug')('openframe:processing'),
    Extension = require('openframe-extension'),
    mkdirp = require('mkdirp');



/**
 * Extension initialization method.
 *
 * Called when the extension (and its dependencies) have been installed.
 *
 * @param  {object} OF An interface provided to extensions giving limited access to the frame environment
 */


module.exports = new Extension({
    format: {
        // the name should be the same as the package name
        'name': pjson.name,
        // this is what might get displayed to users
        'display_name': 'Processing (pde)',
        // does this type of artwork need to be downloaded to the frame?
        'download': true,
        // how do start this type of artwork? currently two token replacements, $filepath and $url
        'start_command': function(custom_opts) {
            mkdirp('/tmp/foo/bar/baz', function(err) {
                if(err) {
                    console.error(err);
                } else {
                    console.log('pow!');
                }
            });
            debug('Artwork config: ', custom_opts);

            var command = 'processing-java';
            //command += '--'

            return command;
        },
        // how do we stop this type of artwork?
        'end_command': 'sudo pkill -f processing-java'
    }
});
