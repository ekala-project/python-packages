{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  pycryptodome,
  requests,
  tzlocal,
}:

buildPythonPackage rec {
  pname = "micloud";
  version = "0.6";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "Squachen";
    repo = "micloud";
    tag = "v_${version}";
    hash = "sha256-IsNXFs1N+rKwqve2Pjp+wRTZCxHF4acEo6KyhsSKuqI=";
  };

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
}
