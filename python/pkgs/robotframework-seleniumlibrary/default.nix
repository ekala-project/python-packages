{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  click,
  robotframework,
  robotframework-pythonlibcore,
  selenium,
}:

buildPythonPackage (finalAttrs: {
  pname = "robotframework-seleniumlibrary";
  version = "6.9.0";
  pyproject = true;

  # no tests included in PyPI tarball
  src = fetchFromGitHub {
    owner = "robotframework";
    repo = "SeleniumLibrary";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NiB1dJWivyDc1ucldQ2cs3jTWt3hHY6AGsboKPmY+mo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    robotframework
    robotframework-pythonlibcore
    selenium
  ];

})
