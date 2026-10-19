{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "downloader-cli";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deepjyoti30";
    repo = "downloader-cli";
    tag = finalAttrs.version;
    hash = "sha256-E2K3n9qCQofm4gXu1l7/0iMoJsniuzhsBUplr4aZ39s=";
  };

  build-system = [ setuptools ];

  dependencies = [ urllib3 ];

  # Disable checks due to networking (Errno 101)

  pythonImportsCheck = [ "downloader_cli" ];

  meta = {
    description = "Downloader with an awesome customizable progressbar";
    mainProgram = "dw";
    homepage = "https://github.com/deepjyoti30/downloader-cli";
    license = lib.licenses.mit;
  };
})
