{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mutf8";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "TkTech";
    repo = "mutf8";
    rev = "v${version}";
    hash = "sha256-Vtfdik+g2jnadslfthGXJWJidzR1BJibod10Wla6lSg=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytest ];

  checkPhase = ''
    # Using pytestCheckHook results in test failures
    pytest
  '';

  pythonImportsCheck = [ "mutf8" ];

  meta = {
    description = "Fast MUTF-8 encoder & decoder";
    homepage = "https://github.com/TkTech/mutf8";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
