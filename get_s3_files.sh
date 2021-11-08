for (( a=0; a<=4; a++ ))
do
	for (( b = 0; b<=9; b++ ))
	do
		wget https://request-image-storage.s3.us-west-2.amazonaws.com/2021/11/05/DM_20211105173456_0$a$b.jpg
		wget https://request-image-storage.s3.us-west-2.amazonaws.com/2021/11/05/DM_20211105173456_0$a$b.webp
		wget https://request-image-storage.s3.us-west-2.amazonaws.com/2021/11/05/DM_20211105173456_0$a$b.png
	done
done

