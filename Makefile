INCLUDE=-I./include/

LIBS=./lib/libmpi.a \
	./lib/lib_hiae.a \
	./lib/libisp.a \
	./lib/lib_hiawb.a \
	./lib/libhi_cipher.a \
	./lib/libVoiceEngine.a \
	./lib/libupvqe.a \
	./lib/libdnvqe.a \
	./lib/libive.a \
	./lib/libmd.a \
	./lib/libsecurec.a \
	./lib/lib_hidrc.a \
	./lib/lib_hildci.a \
	./lib/lib_hidehaze.a \
	./lib/libhdmi.a \
	./lib/libsns_imx327.a  ./lib/libsns_imx327_2l.a -lpthread -lm -ldl

all:rtsp-h264

rtsp-h264:
	arm-himix200-linux-gcc -o rtsp-h264 -Dhi3516dv300 -DSENSOR0_TYPE=SONY_IMX327_MIPI_2M_30FPS_12BIT -DSENSOR1_TYPE=SONY_IMX327_MIPI_2M_30FPS_12BIT -DHI_RELEASE -DHI_XXXX -DISP_V2 -DHI_ACODEC_TYPE_INNER -mcpu=arm926ej-s -mno-unaligned-access -fno-aggressive-loop-optimizations -ffunction-sections -fdata-sections main.c ringfifo.c rtputils.c rtspservice.c rtsputils.c loadbmp.c sample_comm_audio.c sample_comm_isp.c sample_comm_sys.c  sample_comm_venc.c sample_comm_vi.c sample_comm_vo.c sample_comm_vpss.c sample_venc.c $(INCLUDE) $(LIBS)
	
clean:
	rm -rfv rtsp-h264
