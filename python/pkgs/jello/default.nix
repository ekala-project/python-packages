{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  installShellFiles,
  pygments,
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "jello";
  version = "1.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kellyjonbrazil";
    repo = "jello";
    tag = "v${version}";
    hash = "sha256-RAQ04R1zDL9hk1q19GSFvdkxse5rJZXpboAondOoHEc=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ installShellFiles ];

  dependencies = [ pygments ];

  nativeCheckInputs = [ unittestCheckHook ];

  pythonImportsCheck = [ "jello" ];

  postInstall = ''
    installManPage man/jello.1
  '';

  meta = {
    description = "CLI tool to filter JSON and JSON Lines data with Python syntax";
    mainProgram = "jello";
    homepage = "https://github.com/kellyjonbrazil/jello";
    license = lib.licenses.mit;
  };
}
