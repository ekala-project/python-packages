{
  buildPythonPackage,
  pkgs,
  pkg-config,
  # build-system
  setuptools,
}:

let
  sentencepiece-cpp = pkgs.sentencepiece;
in
buildPythonPackage (finalAttrs: {
  pname = "sentencepiece";
  pyproject = true;
  inherit (sentencepiece-cpp) version src;

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ sentencepiece-cpp.dev ];

  sourceRoot = "${finalAttrs.src.name}/python";

  pythonImportsCheck = [ "sentencepiece" ];

  # sentencepiece installs 'bin' output.
  meta = removeAttrs sentencepiece-cpp.meta [ "outputsToInstall" ];
})
