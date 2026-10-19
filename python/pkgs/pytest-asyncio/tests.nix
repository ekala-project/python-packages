{
  buildPythonPackage,
  flaky,
  hypothesis,
  pytest-asyncio,
  pytest-trio,
  pytestCheckHook,
}:

buildPythonPackage {
  pname = "pytest-asyncio-tests";
  inherit (pytest-asyncio) version;

  pyproject = false;

  src = pytest-asyncio.testout;

  dontBuild = true;
  dontInstall = true;

  dependencies = [ pytest-asyncio ];

  nativeCheckInputs = [
    flaky
    hypothesis
    pytest-trio
    pytestCheckHook
  ];
}
