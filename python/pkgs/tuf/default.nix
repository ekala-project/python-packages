{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,
  hatchling,

  # dependencies
  requests,
  securesystemslib,

  # tests
  ed25519,
  freezegun,
}:

buildPythonPackage (finalAttrs: {
  pname = "tuf";
  version = "6.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "theupdateframework";
    repo = "python-tuf";
    tag = "v${finalAttrs.version}";
    hash = "sha256-CPbZOpUYi7MWKLMj7kwTsmEkxLCf4wU7IOCcbzMkPlU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "hatchling==1.27.0" "hatchling"
  '';

  build-system = [
    flit-core
    hatchling
  ];

  dependencies = [
    requests
    securesystemslib
  ]
  ++ securesystemslib.optional-dependencies.pynacl
  ++ securesystemslib.optional-dependencies.crypto;
  pythonImportsCheck = [ "tuf" ];
  meta = {
    description = "Python reference implementation of The Update Framework (TUF)";
    homepage = "https://github.com/theupdateframework/python-tuf";
    license = with lib.licenses; [
      asl20
      mit
    ];
    maintainers = [ ];
  };
})
