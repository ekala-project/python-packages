{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  click,
  pycryptodome,
  requests,
  tzlocal,
}:

buildPythonPackage (finalAttrs: {
  pname = "micloud";
  version = "0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Squachen";
    repo = "micloud";
    tag = "v_${finalAttrs.version}";
    hash = "sha256-IsNXFs1N+rKwqve2Pjp+wRTZCxHF4acEo6KyhsSKuqI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    pycryptodome
    requests
    tzlocal
  ];

  # tests require credentials

  pythonImportsCheck = [ "micloud" ];

  meta = {
    description = "Xiaomi cloud connect library";
    mainProgram = "micloud";
    homepage = "https://github.com/Squachen/micloud";
    license = lib.licenses.mit;
  };
})
