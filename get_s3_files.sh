for (( tm=0; tm<=5; tm++ ))
do

	for (( om=5; om<=9; om++ ))
	do

		for (( ts=0; ts<=5; ts++ ))
		do
			for (( os = 0; os<=9; os++ ))
			do
				wget https://request-image-not-encrypted.s3.us-west-2.amazonaws.com/2021/11/10/11$tm$om$ts$os.JPEG
				wget https://request-image-not-encrypted.s3.us-west-2.amazonaws.com/2021/11/10/11$tm$om$ts$os.PNG
				wget https://request-image-not-encrypted.s3.us-west-2.amazonaws.com/2021/11/10/11$tm$om$ts$os.WEBP
			done
		done
	done
done

