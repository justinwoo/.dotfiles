# forked from nixpkgs
{ lib, fetchFromGitHub }:

fetchFromGitHub rec {
  name = "myrica-2.011.20180119";

  owner = "tomokuni";
  repo = "Myrica";
  rev = "a2383726d3662453ef7efa37862f743a831c7433";
  sha256 = "106wws3q07975r6nkgw178lhdxvc18bmfmd3k88r680q7xc7q8a3";

  postFetch = ''
    tar --strip-components=1 -xzvf $downloadedFile
    mkdir -p $out/share/fonts/truetype
    unzip -d $out/share/fonts/truetype product/Myrica.zip Myrica.TTC
    unzip -d $out/share/fonts/truetype product/MyricaM.zip MyricaM.TTC
  '';

  meta = with lib; {
    homepage = https://myrica.estable.jp/;
    license = licenses.ofl;
    maintainers = with maintainers; [ mikoim ];
    platforms = platforms.all;
  };
}
