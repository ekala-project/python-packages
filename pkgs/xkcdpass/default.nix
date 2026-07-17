{
  lib,
  buildPythonPackage,
  fetchPypi,
  installShellFiles,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xkcdpass";
  version = "1.30.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ijprYCVdpA0OXIEkWCgCeMgtLBy5DkivvWd327+HlcM=";
  };

  nativeBuildInputs = [ installShellFiles ];

  build-system = [ setuptools ];

  postInstall = ''
    installManPage *.?
    install -Dm444 -t $out/share/doc/${pname} README*
  '';

  pythonImportsCheck = [ "xkcdpass" ];

  meta = {
    description = "Generate secure multiword passwords/passphrases, inspired by XKCD";
    homepage = "https://github.com/redacted/XKCD-password-generator";
    license = lib.licenses.bsd3;
  };
}
