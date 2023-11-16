from ultralytics import YOLO
import cv2
#Alejandro Alvarez

model = YOLO('yolov8m-seg.pt')
video_path = "Fruta.mp4"
cap = cv2.VideoCapture(video_path)

while cap.isOpened():
    success, frame = cap.read()

    if success:
        results = model(frame)

        annotated_frame = results[0].plot()

        cv2.imshow("YOLOv8 infrence", annotated_frame)

        if cv2.waitKey(1) & 0xFF == ord ("q"):
            break
        #else:
            #break

cap.release()
cv2.destroyAllWindows