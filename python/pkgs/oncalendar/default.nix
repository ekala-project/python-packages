{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "oncalendar";
  version = "1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cuu508";
    repo = "oncalendar";
    tag = "v${version}";
    hash = "sha256-MPKzC2QYA3tWxg19URKheAbPaiS0jXP96xR0Hyl58V0=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "oncalendar" ];

  meta = {
    description = "Systemd OnCalendar expression parser and evaluator";
    homepage = "https://github.com/cuu508/oncalendar";
    license = lib.licenses.bsd3;
  };
}
