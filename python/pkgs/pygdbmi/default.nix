{
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygdbmi";
  version = "0.11.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cs01";
    repo = "pygdbmi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JqEDN8Pg/JttyYQbwkxKkLYuxVnvV45VlClD23eaYyc=";
  };

  build-system = [ setuptools ];

  doCheck = !stdenv.hostPlatform.isDarwin;

})
