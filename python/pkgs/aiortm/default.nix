{
  lib,
  aiohttp,
  aioresponses,
  buildPythonPackage,
  ciso8601,
  fetchFromGitHub,
  mashumaro,
  pytest-asyncio,
  pytest-cov-stub,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  typer,
  yarl,
}:

buildPythonPackage rec {
  pname = "aiortm";
  version = "0.20.1";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "MartinHjelmare";
    repo = "aiortm";
    tag = "v${version}";
    hash = "sha256-KhvqTj33dtJschS9ImSJdjwdAjXrm7b6Ng1KDBgMFog=";
  };

  pythonRelaxDeps = [ "typer" ];

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    ciso8601
    mashumaro
    yarl
  ];

  optional-dependencies = {
    cli = [ typer ];
  };

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytest-cov-stub
    pytestCheckHook
  ]
  ++ lib.concatAttrValues optional-dependencies;

  pythonImportsCheck = [ "aiortm" ];

  meta = {
    description = "Library for the Remember the Milk API";
    homepage = "https://github.com/MartinHjelmare/aiortm";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "aiortm";
  };
}
