{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "dj-search-url";
  version = "0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Qk0aWFJQCzwRir/dDjCz4AFv5o5+0nuFU6Z6+iDU+0A=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dj_search_url" ];

  meta = {
    description = "Use Search URLs in your Django Haystack Application";
    homepage = "https://github.com/dstufft/dj-search-url";
    license = lib.licenses.bsd0;
  };
}
