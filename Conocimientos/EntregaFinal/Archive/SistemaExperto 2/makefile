all: expert

expert:
	javac -classpath ./CLIPSJNI.jar RecommendSystem.java
	java -cp .:./CLIPSJNI.jar -Djava.library.path=./ RecommendSystem

