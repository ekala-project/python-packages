{
  lib,
  babel,
  buildPythonPackage,
  click,
  cryptography,
  fetchPypi,
  installShellFiles,
  markdown,
  pyyaml,
  requests,
  requests-oauthlib,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "apprise";
  version = "1.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-52id2nGq9zkkTWyGkN4TyxNhuNCnmYD7SLs5dFXKC90=";
  };

  nativeBuildInputs = [ installShellFiles ];

  build-system = [
    babel
    setuptools
  ];

  dependencies = [
    click
    cryptography
    markdown
    pyyaml
    requests
    requests-oauthlib
  ];

  postInstall = ''
    installManPage packaging/man/apprise.1
  '';

  pythonImportsCheck = [ "apprise" ];

  meta = {
    description = "Push Notifications that work with just about every platform";
    homepage = "https://appriseit.com/";
    license = lib.licenses.bsd2;
    mainProgram = "apprise";
  };
})
