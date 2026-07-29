{
  buildPythonPackage,
  hatchling,
  lib,
  pkgs,
}:

let
  uv-bin = pkgs.uv;
in
buildPythonPackage {
  inherit (uv-bin)
    pname
    version
    src
    meta
    ;
  pyproject = true;

  build-system = [ hatchling ];

  postPatch = ''
    substituteInPlace python/uv/_find_uv.py \
      --replace-fail \
      'sysconfig.get_path("scripts", scheme=_user_scheme()),' \
      'sysconfig.get_path("scripts", scheme=_user_scheme()), "${baseNameOf (lib.getExe uv-bin)}",'
  ''
  + ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["maturin>=1.0,<2.0"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "maturin"' 'build-backend = "hatchling.build"'

    cat >> pyproject.toml <<EOF
    [tool.hatch.build]
    packages = ['python/uv']

    EOF
  '';

  postInstall = ''
    mkdir -p $out/bin && ln -s ${lib.getExe uv-bin} $out/bin/uv
  '';

  pythonImportsCheck = [ "uv" ];
}
