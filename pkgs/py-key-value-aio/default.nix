{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uv-build,
  beartype,
  typing-extensions,

  # optional-dependencies
  cachetools,
  diskcache,
  pathvalidate,
  aiofile,
  anyio,
  keyring,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-key-value-aio";
  version = "0.4.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "strawgate";
    repo = "py-key-value";
    tag = finalAttrs.version;
    hash = "sha256-N+bqgKkSVGEKW/BEWgcFiHEuFjGbgIn/j33Vd0YoJ7s=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail \
        "uv_build>=0.11.4,<0.12" \
        "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [
    beartype
    typing-extensions
  ];

  optional-dependencies = {
    memory = [ cachetools ];
    disk = [
      diskcache
      pathvalidate
    ];
    filetree = [
      aiofile
      anyio
    ];
    keyring = [ keyring ];
  };

  pythonImportsCheck = [ "key_value.aio" ];

  meta = {
    description = "Async Key-Value";
    homepage = "https://github.com/strawgate/py-key-value";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
