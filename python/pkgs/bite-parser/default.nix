{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytest-asyncio,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "bite-parser";
  version = "0.2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jgosmann";
    repo = "bite-parser";
    tag = "v${version}";
    hash = "sha256-C508csRbjCeLgkp66TwDuxUtMITTmub5/TFv8x80HLA=";
  };

  build-system = [ poetry-core ];

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "bite" ];

  meta = {
    description = "Asynchronous parser taking incremental bites out of your byte input stream";
    homepage = "https://github.com/jgosmann/bite-parser";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
