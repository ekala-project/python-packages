{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  six,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mando";
  version = "0.8.2";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "rubik";
    repo = "mando";
    rev = "v${version}";
    hash = "sha256-FuQZ53ojrQO++0TN0C3hk0LXH+mcfRqtGq8VvfYDufg=";
  };

  nativeBuildInputs = [ setuptools ];
  propagatedBuildInputs = [ six ];

  pythonImportsCheck = [ "mando" ];

  meta = {
    description = "Create Python CLI apps with little to no effort at all";
    homepage = "https://mando.readthedocs.org";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
