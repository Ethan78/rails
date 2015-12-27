#coding: utf-8

names=%w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames=["太郎","ジノ","ホモ","田中"]
gnames=["太郎","ボブ","花子"]
0.upto(9) do |idx|
	Member.create(number: idx+10,
		name: names[idx],
		full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
		email: "#{names[idx]}@example.com",
		birthday: "1981-12-01",
		gender: [0,0,1][idx % 3],
		administrator:(idx==0)
	)
end
