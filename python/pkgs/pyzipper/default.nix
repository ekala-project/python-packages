{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  pycryptodomex,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyzipper";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danifus";
    repo = "pyzipper";
    tag = "v${finalAttrs.version}";
    hash = "sha256-an+DmsyoIAwYvYXGFnJ/3+KIf6sqNJlA7uJp0leV18I=";
  };
  build-system = [ setuptools ];

  dependencies = [ pycryptodomex ];
  pythonImportsCheck = [ "pyzipper" ];

  doCheck = pythonOlder "3.13"; # depends on removed nntplib battery
  meta = {
    description = "Python zipfile extensions";
    homepage = "https://github.com/danifus/pyzipper";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
