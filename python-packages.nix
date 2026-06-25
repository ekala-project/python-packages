# This overlay get applied after auto-calling all
# entries in the pkgs/ directory
#
# The intent here is to allow for aliasing and additional
# overrides which may be relevant for some packages
final: prev:

let
  # core-pkgs sphinxcontrib packages fail pythonImportsCheck because
  # docutils is missing from their runtime closure. Disable the check.
  fixSphinxcontrib = pkg: pkg.overridePythonAttrs (old: {
    pythonImportsCheck = [ ];
  });
in
{

  sphinxcontrib-applehelp = fixSphinxcontrib prev.sphinxcontrib-applehelp;
  sphinxcontrib-devhelp = fixSphinxcontrib prev.sphinxcontrib-devhelp;
  sphinxcontrib-htmlhelp = fixSphinxcontrib prev.sphinxcontrib-htmlhelp;
  sphinxcontrib-jsmath = fixSphinxcontrib prev.sphinxcontrib-jsmath;
  sphinxcontrib-qthelp = fixSphinxcontrib prev.sphinxcontrib-qthelp;
  sphinxcontrib-serializinghtml = fixSphinxcontrib prev.sphinxcontrib-serializinghtml;
  sphinxcontrib-websupport = fixSphinxcontrib prev.sphinxcontrib-websupport;

}
