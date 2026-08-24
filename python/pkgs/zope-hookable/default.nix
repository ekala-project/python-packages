{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope-hookable";
  version = "8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.hookable";
    tag = version;
    hash = "sha256-pryx55dzvg+6jSUj4avskTnGKe6w1HkEh6v6OOlHIXY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.hookable" ];

  unittestFlagsArray = [ "src/zope/hookable/tests" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Supports the efficient creation of “hookable” objects";
    homepage = "https://github.com/zopefoundation/zope.hookable";
    license = lib.licenses.zpl21;
  };
}
