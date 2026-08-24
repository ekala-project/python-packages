{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchPypi,
  installShellFiles,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "git-filter-repo";
  version = "2.47.0";
  docs_version = "71d71d4be238628bf9cb9b27be79b8bb824ed1a9";
  pyproject = true;

  src = fetchPypi {
    pname = "git_filter_repo";
    inherit version;
    hash = "sha256-QRsn5ooIDAemnCM8tSbbwthIsJpy8QR39ERN0IIs8pA=";
  };

  docs = fetchFromGitHub {
    owner = "newren";
    repo = "git-filter-repo";
    rev = docs_version;
    hash = "sha256-m9NI7bLR5F+G7f3Dyi4sP6n4qz2i8cdBRuIn0OcpHAw=";
  };

  postInstall = ''
    installManPage ${docs}/man1/git-filter-repo.1
  '';

  build-system = [ setuptools-scm ];

  nativeBuildInputs = [ installShellFiles ];

  # Project has no tests
  pythonImportsCheck = [ "git_filter_repo" ];

  meta = {
    description = "Quickly rewrite git repository history";
    homepage = "https://github.com/newren/git-filter-repo";
    license = with lib.licenses; [
      mit # or
      gpl2Plus
    ];
    maintainers = [ ];
    mainProgram = "git-filter-repo";
  };

}
