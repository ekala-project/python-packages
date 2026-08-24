{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # docs
  sphinx-rtd-theme
, sphinxHook
, # dependencies
  colorzero
,
}:

buildPythonPackage rec {
  pname = "gpiozero";
  version = "2.0.1.post3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gpiozero";
    repo = "gpiozero";
    tag = "v${version}";
    hash = "sha256-8NSGR+GLnf+7F9iu0XVK/yVYVw8L9b73FIs07OSvMj4=";
  };

  outputs = [
    "out"
    "doc"
  ];

  nativeBuildInputs = [
    setuptools
    sphinx-rtd-theme
    sphinxHook
  ];

  propagatedBuildInputs = [ colorzero ];

  pythonImportsCheck = [
    "gpiozero"
    "gpiozero.tools"
  ];

  meta = {
    description = "Simple interface to GPIO devices with Raspberry Pi";
    homepage = "https://github.com/gpiozero/gpiozero";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
    maintainers = [ ];
  };
}
