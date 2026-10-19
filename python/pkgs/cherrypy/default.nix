{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  cheroot,
  jaraco-collections,
  more-itertools,
  portend,
  zc-lockfile,

  # optional-dependencies
  simplejson,
}:

buildPythonPackage (finalAttrs: {
  pname = "cherrypy";
  version = "18.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bHDnjuETAOiyHAdnxUKuaxAqScrFz9Tj4xPXu5B8WJE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    cheroot
    jaraco-collections
    more-itertools
    portend
    zc-lockfile
  ];

  optional-dependencies = {
    json = [ simplejson ];
  };

  pythonImportsCheck = [ "cherrypy" ];

  meta = {
    homepage = "https://cherrypy.dev/";
    description = "Object-oriented HTTP framework";
    mainProgram = "cherryd";
    license = lib.licenses.bsd3;
  };
})
