{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "token-bucket";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "falconry";
    repo = "token-bucket";
    tag = finalAttrs.version;
    hash = "sha256-ZWmrLZ3CsotGAoVdbVTz7YNrBHfCKR5t94wrdVMM3P4=";
  };

  build-system = [ setuptools ];

  doCheck = !stdenv.hostPlatform.isDarwin;

  meta = {
    description = "Token Bucket Implementation for Python Web Apps";
    homepage = "https://github.com/falconry/token-bucket";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
