{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "publicsuffix2";
  version = "2.20191221";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-APjMMaqNDVWSpc7RnMy6feQo68qYXbJqyFLZIN3W/ns=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "'requests >= 2.7.0'," ""
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "publicsuffix2" ];

  meta = {
    description = "Get a public suffix for a domain name using the Public Suffix List";
    homepage = "https://github.com/nexB/python-publicsuffix2";
    license = lib.licenses.mpl20;
  };
})
