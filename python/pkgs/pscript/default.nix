{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pscript";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "flexxui";
    repo = "pscript";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pqjig3dFJ4zfpor6TT6fiBMS7lAtJE/bAYbzl46W/YY=";
  };

  postPatch = ''
    # https://github.com/flexxui/pscript/pull/77
    substituteInPlace pscript/commonast.py \
      --replace-fail "ast.Ellipsis" "ast.Constant"
  '';

  build-system = [ flit-core ];

  meta = {
    description = "Python to JavaScript compiler";
    homepage = "https://pscript.readthedocs.io";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
})
