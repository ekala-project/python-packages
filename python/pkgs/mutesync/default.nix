{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mutesync";
  version = "0.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1lz3q3q9lw8qxxb8jyrak77v6hkxwi39akyx96j8hd5jjaq2k5qc";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    async-timeout
  ];

  # Project has not published tests yet

  pythonImportsCheck = [ "mutesync" ];

  meta = {
    description = "Python module for interacting with mutesync buttons";
    homepage = "https://github.com/currentoor/pymutesync";
    license = lib.licenses.asl20;
  };
})
