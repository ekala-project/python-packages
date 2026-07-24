{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  google-auth,
  httplib2,
}:

buildPythonPackage rec {
  pname = "google-auth-httplib2";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "google-auth-library-python-httplib2";
    tag = "v${version}";
    sha256 = "sha256-NXz2oqbNVGTWOECH+Ly9v/CMxbhygFZhlHRHrnYLhCg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-auth
    httplib2
  ];

  meta = {
    description = "Google Authentication Library: httplib2 transport";
    homepage = "https://github.com/GoogleCloudPlatform/google-auth-library-python-httplib2";
    license = lib.licenses.asl20;
  };
}
