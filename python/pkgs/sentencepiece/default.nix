{
  buildPythonPackage,
  pkgs,
  pkg-config,
}:

let
  sentencepiece-cpp = pkgs.sentencepiece;
in
buildPythonPackage rec {
  pname = "sentencepiece";
  format = "setuptools";
  inherit (sentencepiece-cpp) version src;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ sentencepiece-cpp.dev ];

  sourceRoot = "${src.name}/python";

  pythonImportsCheck = [ "sentencepiece" ];

  # sentencepiece installs 'bin' output.
  meta = removeAttrs sentencepiece-cpp.meta [ "outputsToInstall" ];
}
