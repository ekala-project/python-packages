{ lib
, buildPythonPackage
, fetchFromGitHub
, six
,
}:

buildPythonPackage rec {
  pname = "pyu2f";
  version = "0.1.5a";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "google";
    repo = "pyu2f";
    tag = version;
    sha256 = "0mx7bn1p3n0fxyxa82wg3c719hby7vqkxv57fhf7zvhlg2zfnr0v";
  };

  propagatedBuildInputs = [ six ];

  postPatch = ''
    for path in \
      customauthenticator_test.py \
      hardware_test.py \
      hidtransport_test.py \
      localauthenticator_test.py \
      model_test.py \
      u2f_test.py \
      util_test.py \
      hid/macos_test.py; \
    do
      # https://docs.python.org/3/whatsnew/3.12.html#id3
      substituteInPlace pyu2f/tests/$path \
        --replace "assertEquals" "assertEqual" \
        --replace "assertRaisesRegexp" "assertRaisesRegex"
    done
  '';

  meta = {
    description = "U2F host library for interacting with a U2F device over USB";
    homepage = "https://github.com/google/pyu2f";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
