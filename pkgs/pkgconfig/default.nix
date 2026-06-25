{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pkg-config,
}:

buildPythonPackage rec {
  pname = "pkgconfig";
  version = "1.5.5";
  pyproject = true;

  inherit (pkg-config)
    setupHooks
    wrapperName
    suffixSalt
    targetPrefix
    baseBinName
    ;

  src = fetchFromGitHub {
    owner = "matze";
    repo = "pkgconfig";
    rev = "v${version}";
    hash = "sha256-uuLUGRNLCR3NS9g6OPCI+qG7tPWsLhI3OE5WmSI3vm8=";
  };

  postPatch = ''
    substituteInPlace pkgconfig/pkgconfig.py \
      --replace "pkg_config_exe = os.environ.get('PKG_CONFIG', None) or 'pkg-config'" "pkg_config_exe = '${pkg-config}/bin/${pkg-config.targetPrefix}pkg-config'"

    substituteInPlace data/fake-openssl.pc \
      --replace "Requires: libssl libcrypto" ""
  '';

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pkgconfig" ];

  meta = {
    description = "Interface Python with pkg-config";
    homepage = "https://github.com/matze/pkgconfig";
    license = lib.licenses.mit;
  };
}
