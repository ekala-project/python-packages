{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytest-asyncio,
  pytest-httpbin,
  pyyaml,
  six,
  urllib3,
  yarl,
  wrapt,
}:

buildPythonPackage rec {
  pname = "vcrpy";
  version = "8.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kevin1024";
    repo = "vcrpy";
    tag = "v${version}";
    hash = "sha256-WQLWUr1EgOibdAVVASxMzeFi1YikYAjjye/NtCEJ6Kk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    six
    urllib3
    wrapt
    yarl
  ];
  pythonImportsCheck = [ "vcr" ];

  meta = {
    description = "Automatically mock your HTTP interactions to simplify and speed up testing";
    homepage = "https://github.com/kevin1024/vcrpy";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
