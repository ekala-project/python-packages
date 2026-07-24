{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pfzy,
  poetry-core,
  prompt-toolkit,
}:

buildPythonPackage rec {
  pname = "inquirerpy";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kazhala";
    repo = "InquirerPy";
    tag = version;
    hash = "sha256-Ap0xZHEU458tjm6oEN5EtDoSRlnpZ7jvDq1L7fTlQQc=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    pfzy
    prompt-toolkit
  ];
  pythonImportsCheck = [ "InquirerPy" ];
  meta = {
    description = "Python port of Inquirer.js";
    homepage = "https://github.com/kazhala/InquirerPy";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
