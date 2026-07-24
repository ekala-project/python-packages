{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  uv-build,
  beartype,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-key-value-shared";
  version = "0.4.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "strawgate";
    repo = "py-key-value";
    tag = finalAttrs.version;
    hash = "sha256-N+bqgKkSVGEKW/BEWgcFiHEuFjGbgIn/j33Vd0YoJ7s=";
  };

  sourceRoot = "${finalAttrs.src.name}/key-value/key-value-shared";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail \
        "uv_build>=0.8.2,<0.9.0" \
        "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [
    beartype
    typing-extensions
  ];

  pythonImportsCheck = [ "key_value.shared" ];

  meta = {
    description = "Shared code between key-value-aio and key-value-sync";
    homepage = "https://github.com/strawgate/py-key-value";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
